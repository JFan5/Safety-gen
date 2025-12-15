(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v12 ?v10)
             (pred_9 ?v13 ?v5)
             (pred_8 ?v12 ?v5)
             (pred_3 ?v8 ?v12 )
	     (pred_2 ?v12)
             (pred_1 ?v7)
             (pred_12 ?v13)
             (pred_6 ?v5)
             (pred_5 ?v12)
             (pred_10 ?v13)
             (pred_7 ?v12)
             (pred_11 ))



(:action op_1
:parameters (?v3 ?v1 ?v2 ?v6)
:precondition (and (pred_1 ?v3) (pred_1 ?v1) (pred_12 ?v2) (pred_6 ?v6)
          (pred_4 ?v3 ?v1) (pred_9 ?v2 ?v6)
                   (pred_8 ?v1 ?v6) (pred_2 ?v3) 
                   (pred_5 ?v1) (pred_10 ?v2))
:effect (and  (pred_7 ?v1) (not (pred_5 ?v1))))


(:action op_4
:parameters (?v3 ?v4)
:precondition (and (pred_1 ?v3) (pred_1 ?v4)
               (pred_2 ?v3) (pred_4 ?v3 ?v4) (pred_7 ?v4))
:effect (and (pred_2 ?v4) (not (pred_2 ?v3))))

(:action op_5
:parameters (?v3 ?v2)
:precondition (and (pred_1 ?v3) (pred_12 ?v2) 
                  (pred_2 ?v3) (pred_3 ?v2 ?v3) (pred_11 ))
:effect (and (pred_10 ?v2)
   (not (pred_3 ?v2 ?v3)) (not (pred_11 ))))


(:action op_2
:parameters (?v3 ?v11 ?v9)
:precondition (and (pred_1 ?v3) (pred_12 ?v11) (pred_12 ?v9)
                  (pred_2 ?v3) (pred_10 ?v9) (pred_3 ?v11 ?v3))
:effect (and (pred_10 ?v11) (pred_3 ?v9 ?v3)
        (not (pred_10 ?v9)) (not (pred_3 ?v11 ?v3))))

(:action op_3
:parameters (?v3 ?v2)
:precondition (and (pred_1 ?v3) (pred_12 ?v2) 
                  (pred_2 ?v3) (pred_10 ?v2))
:effect (and (pred_11 ) (pred_3 ?v2 ?v3) (not (pred_10 ?v2)))))


	
