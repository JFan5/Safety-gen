(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v5 ?v12)
             (pred_9 ?v8 ?v1)
             (pred_3 ?v5 ?v1)
             (pred_4 ?v9 ?v5 )
	     (pred_1 ?v5)
             (pred_6 ?v4)
             (pred_2 ?v8)
             (pred_11 ?v1)
             (pred_10 ?v5)
             (pred_7 ?v8)
             (pred_5 ?v5)
             (pred_8 ))



(:action op_1
:parameters (?v3 ?v2 ?v13 ?v7)
:precondition (and (pred_6 ?v3) (pred_6 ?v2) (pred_2 ?v13) (pred_11 ?v7)
          (pred_12 ?v3 ?v2) (pred_9 ?v13 ?v7)
                   (pred_3 ?v2 ?v7) (pred_1 ?v3) 
                   (pred_10 ?v2) (pred_7 ?v13))
:effect (and  (pred_5 ?v2) (not (pred_10 ?v2))))


(:action op_3
:parameters (?v3 ?v6)
:precondition (and (pred_6 ?v3) (pred_6 ?v6)
               (pred_1 ?v3) (pred_12 ?v3 ?v6) (pred_5 ?v6))
:effect (and (pred_1 ?v6) (not (pred_1 ?v3))))

(:action op_2
:parameters (?v3 ?v13)
:precondition (and (pred_6 ?v3) (pred_2 ?v13) 
                  (pred_1 ?v3) (pred_4 ?v13 ?v3) (pred_8 ))
:effect (and (pred_7 ?v13)
   (not (pred_4 ?v13 ?v3)) (not (pred_8 ))))


(:action op_4
:parameters (?v3 ?v10 ?v11)
:precondition (and (pred_6 ?v3) (pred_2 ?v10) (pred_2 ?v11)
                  (pred_1 ?v3) (pred_7 ?v11) (pred_4 ?v10 ?v3))
:effect (and (pred_7 ?v10) (pred_4 ?v11 ?v3)
        (not (pred_7 ?v11)) (not (pred_4 ?v10 ?v3))))

(:action op_5
:parameters (?v3 ?v13)
:precondition (and (pred_6 ?v3) (pred_2 ?v13) 
                  (pred_1 ?v3) (pred_7 ?v13))
:effect (and (pred_8 ) (pred_4 ?v13 ?v3) (not (pred_7 ?v13)))))


	
