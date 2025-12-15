(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v4 ?v2)
             (pred_7 ?v10 ?v13)
             (pred_9 ?v4 ?v13)
             (pred_1 ?v3 ?v4 )
	     (pred_4 ?v4)
             (pred_10 ?v9)
             (pred_11 ?v10)
             (pred_6 ?v13)
             (pred_12 ?v4)
             (pred_2 ?v10)
             (pred_5 ?v4)
             (pred_8 ))



(:action op_3
:parameters (?v1 ?v7 ?v11 ?v5)
:precondition (and (pred_10 ?v1) (pred_10 ?v7) (pred_11 ?v11) (pred_6 ?v5)
          (pred_3 ?v1 ?v7) (pred_7 ?v11 ?v5)
                   (pred_9 ?v7 ?v5) (pred_4 ?v1) 
                   (pred_12 ?v7) (pred_2 ?v11))
:effect (and  (pred_5 ?v7) (not (pred_12 ?v7))))


(:action op_1
:parameters (?v1 ?v6)
:precondition (and (pred_10 ?v1) (pred_10 ?v6)
               (pred_4 ?v1) (pred_3 ?v1 ?v6) (pred_5 ?v6))
:effect (and (pred_4 ?v6) (not (pred_4 ?v1))))

(:action op_2
:parameters (?v1 ?v11)
:precondition (and (pred_10 ?v1) (pred_11 ?v11) 
                  (pred_4 ?v1) (pred_1 ?v11 ?v1) (pred_8 ))
:effect (and (pred_2 ?v11)
   (not (pred_1 ?v11 ?v1)) (not (pred_8 ))))


(:action op_5
:parameters (?v1 ?v8 ?v12)
:precondition (and (pred_10 ?v1) (pred_11 ?v8) (pred_11 ?v12)
                  (pred_4 ?v1) (pred_2 ?v12) (pred_1 ?v8 ?v1))
:effect (and (pred_2 ?v8) (pred_1 ?v12 ?v1)
        (not (pred_2 ?v12)) (not (pred_1 ?v8 ?v1))))

(:action op_4
:parameters (?v1 ?v11)
:precondition (and (pred_10 ?v1) (pred_11 ?v11) 
                  (pred_4 ?v1) (pred_2 ?v11))
:effect (and (pred_8 ) (pred_1 ?v11 ?v1) (not (pred_2 ?v11)))))


	
