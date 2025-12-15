(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v9 ?v13)
             (pred_6 ?v8 ?v10)
             (pred_3 ?v9 ?v10)
             (pred_5 ?v5 ?v9 )
	     (pred_7 ?v9)
             (pred_10 ?v1)
             (pred_4 ?v8)
             (pred_2 ?v10)
             (pred_9 ?v9)
             (pred_1 ?v8)
             (pred_11 ?v9)
             (pred_8 ))



(:action op_5
:parameters (?v3 ?v6 ?v11 ?v4)
:precondition (and (pred_10 ?v3) (pred_10 ?v6) (pred_4 ?v11) (pred_2 ?v4)
          (pred_12 ?v3 ?v6) (pred_6 ?v11 ?v4)
                   (pred_3 ?v6 ?v4) (pred_7 ?v3) 
                   (pred_9 ?v6) (pred_1 ?v11))
:effect (and  (pred_11 ?v6) (not (pred_9 ?v6))))


(:action op_4
:parameters (?v3 ?v12)
:precondition (and (pred_10 ?v3) (pred_10 ?v12)
               (pred_7 ?v3) (pred_12 ?v3 ?v12) (pred_11 ?v12))
:effect (and (pred_7 ?v12) (not (pred_7 ?v3))))

(:action op_1
:parameters (?v3 ?v11)
:precondition (and (pred_10 ?v3) (pred_4 ?v11) 
                  (pred_7 ?v3) (pred_5 ?v11 ?v3) (pred_8 ))
:effect (and (pred_1 ?v11)
   (not (pred_5 ?v11 ?v3)) (not (pred_8 ))))


(:action op_3
:parameters (?v3 ?v7 ?v2)
:precondition (and (pred_10 ?v3) (pred_4 ?v7) (pred_4 ?v2)
                  (pred_7 ?v3) (pred_1 ?v2) (pred_5 ?v7 ?v3))
:effect (and (pred_1 ?v7) (pred_5 ?v2 ?v3)
        (not (pred_1 ?v2)) (not (pred_5 ?v7 ?v3))))

(:action op_2
:parameters (?v3 ?v11)
:precondition (and (pred_10 ?v3) (pred_4 ?v11) 
                  (pred_7 ?v3) (pred_1 ?v11))
:effect (and (pred_8 ) (pred_5 ?v11 ?v3) (not (pred_1 ?v11)))))


	
