(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v7 ?v10)
             (pred_7 ?v8 ?v5)
             (pred_10 ?v7 ?v5)
             (pred_2 ?v9 ?v7 )
	     (pred_12 ?v7)
             (pred_4 ?v1)
             (pred_3 ?v8)
             (pred_9 ?v5)
             (pred_5 ?v7)
             (pred_11 ?v8)
             (pred_8 ?v7)
             (pred_1 ))



(:action op_3
:parameters (?v4 ?v11 ?v3 ?v6)
:precondition (and (pred_4 ?v4) (pred_4 ?v11) (pred_3 ?v3) (pred_9 ?v6)
          (pred_6 ?v4 ?v11) (pred_7 ?v3 ?v6)
                   (pred_10 ?v11 ?v6) (pred_12 ?v4) 
                   (pred_5 ?v11) (pred_11 ?v3))
:effect (and  (pred_8 ?v11) (not (pred_5 ?v11))))


(:action op_1
:parameters (?v4 ?v2)
:precondition (and (pred_4 ?v4) (pred_4 ?v2)
               (pred_12 ?v4) (pred_6 ?v4 ?v2) (pred_8 ?v2))
:effect (and (pred_12 ?v2) (not (pred_12 ?v4))))

(:action op_4
:parameters (?v4 ?v3)
:precondition (and (pred_4 ?v4) (pred_3 ?v3) 
                  (pred_12 ?v4) (pred_2 ?v3 ?v4) (pred_1 ))
:effect (and (pred_11 ?v3)
   (not (pred_2 ?v3 ?v4)) (not (pred_1 ))))


(:action op_2
:parameters (?v4 ?v12 ?v13)
:precondition (and (pred_4 ?v4) (pred_3 ?v12) (pred_3 ?v13)
                  (pred_12 ?v4) (pred_11 ?v13) (pred_2 ?v12 ?v4))
:effect (and (pred_11 ?v12) (pred_2 ?v13 ?v4)
        (not (pred_11 ?v13)) (not (pred_2 ?v12 ?v4))))

(:action op_5
:parameters (?v4 ?v3)
:precondition (and (pred_4 ?v4) (pred_3 ?v3) 
                  (pred_12 ?v4) (pred_11 ?v3))
:effect (and (pred_1 ) (pred_2 ?v3 ?v4) (not (pred_11 ?v3)))))


	
