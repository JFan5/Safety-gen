(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v3 ?v7)
             (pred_10 ?v2 ?v13)
             (pred_8 ?v3 ?v13)
             (pred_4 ?v4 ?v3 )
	     (pred_3 ?v3)
             (pred_2 ?v12)
             (pred_1 ?v2)
             (pred_9 ?v13)
             (pred_12 ?v3)
             (pred_5 ?v2)
             (pred_11 ?v3)
             (pred_6 ))



(:action op_4
:parameters (?v1 ?v8 ?v11 ?v10)
:precondition (and (pred_2 ?v1) (pred_2 ?v8) (pred_1 ?v11) (pred_9 ?v10)
          (pred_7 ?v1 ?v8) (pred_10 ?v11 ?v10)
                   (pred_8 ?v8 ?v10) (pred_3 ?v1) 
                   (pred_12 ?v8) (pred_5 ?v11))
:effect (and  (pred_11 ?v8) (not (pred_12 ?v8))))


(:action op_1
:parameters (?v1 ?v6)
:precondition (and (pred_2 ?v1) (pred_2 ?v6)
               (pred_3 ?v1) (pred_7 ?v1 ?v6) (pred_11 ?v6))
:effect (and (pred_3 ?v6) (not (pred_3 ?v1))))

(:action op_3
:parameters (?v1 ?v11)
:precondition (and (pred_2 ?v1) (pred_1 ?v11) 
                  (pred_3 ?v1) (pred_4 ?v11 ?v1) (pred_6 ))
:effect (and (pred_5 ?v11)
   (not (pred_4 ?v11 ?v1)) (not (pred_6 ))))


(:action op_2
:parameters (?v1 ?v9 ?v5)
:precondition (and (pred_2 ?v1) (pred_1 ?v9) (pred_1 ?v5)
                  (pred_3 ?v1) (pred_5 ?v5) (pred_4 ?v9 ?v1))
:effect (and (pred_5 ?v9) (pred_4 ?v5 ?v1)
        (not (pred_5 ?v5)) (not (pred_4 ?v9 ?v1))))

(:action op_5
:parameters (?v1 ?v11)
:precondition (and (pred_2 ?v1) (pred_1 ?v11) 
                  (pred_3 ?v1) (pred_5 ?v11))
:effect (and (pred_6 ) (pred_4 ?v11 ?v1) (not (pred_5 ?v11)))))


	
