(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v6 ?v1)
             (pred_12 ?v13 ?v5)
             (pred_5 ?v6 ?v5)
             (pred_1 ?v7 ?v6 )
	     (pred_8 ?v6)
             (pred_10 ?v10)
             (pred_3 ?v13)
             (pred_11 ?v5)
             (pred_9 ?v6)
             (pred_6 ?v13)
             (pred_2 ?v6)
             (pred_4 ))



(:action op_3
:parameters (?v3 ?v4 ?v11 ?v2)
:precondition (and (pred_10 ?v3) (pred_10 ?v4) (pred_3 ?v11) (pred_11 ?v2)
          (pred_7 ?v3 ?v4) (pred_12 ?v11 ?v2)
                   (pred_5 ?v4 ?v2) (pred_8 ?v3) 
                   (pred_9 ?v4) (pred_6 ?v11))
:effect (and  (pred_2 ?v4) (not (pred_9 ?v4))))


(:action op_2
:parameters (?v3 ?v12)
:precondition (and (pred_10 ?v3) (pred_10 ?v12)
               (pred_8 ?v3) (pred_7 ?v3 ?v12) (pred_2 ?v12))
:effect (and (pred_8 ?v12) (not (pred_8 ?v3))))

(:action op_1
:parameters (?v3 ?v11)
:precondition (and (pred_10 ?v3) (pred_3 ?v11) 
                  (pred_8 ?v3) (pred_1 ?v11 ?v3) (pred_4 ))
:effect (and (pred_6 ?v11)
   (not (pred_1 ?v11 ?v3)) (not (pred_4 ))))


(:action op_5
:parameters (?v3 ?v8 ?v9)
:precondition (and (pred_10 ?v3) (pred_3 ?v8) (pred_3 ?v9)
                  (pred_8 ?v3) (pred_6 ?v9) (pred_1 ?v8 ?v3))
:effect (and (pred_6 ?v8) (pred_1 ?v9 ?v3)
        (not (pred_6 ?v9)) (not (pred_1 ?v8 ?v3))))

(:action op_4
:parameters (?v3 ?v11)
:precondition (and (pred_10 ?v3) (pred_3 ?v11) 
                  (pred_8 ?v3) (pred_6 ?v11))
:effect (and (pred_4 ) (pred_1 ?v11 ?v3) (not (pred_6 ?v11)))))


	
