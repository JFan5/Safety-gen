(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v11 ?v2)
             (pred_12 ?v7 ?v8)
             (pred_4 ?v11 ?v8)
             (pred_3 ?v4 ?v11 )
	     (pred_1 ?v11)
             (pred_6 ?v9)
             (pred_5 ?v7)
             (pred_11 ?v8)
             (pred_8 ?v11)
             (pred_2 ?v7)
             (pred_7 ?v11)
             (pred_9 ))



(:action op_1
:parameters (?v1 ?v13 ?v10 ?v5)
:precondition (and (pred_6 ?v1) (pred_6 ?v13) (pred_5 ?v10) (pred_11 ?v5)
          (pred_10 ?v1 ?v13) (pred_12 ?v10 ?v5)
                   (pred_4 ?v13 ?v5) (pred_1 ?v1) 
                   (pred_8 ?v13) (pred_2 ?v10))
:effect (and  (pred_7 ?v13) (not (pred_8 ?v13))))


(:action op_4
:parameters (?v1 ?v6)
:precondition (and (pred_6 ?v1) (pred_6 ?v6)
               (pred_1 ?v1) (pred_10 ?v1 ?v6) (pred_7 ?v6))
:effect (and (pred_1 ?v6) (not (pred_1 ?v1))))

(:action op_5
:parameters (?v1 ?v10)
:precondition (and (pred_6 ?v1) (pred_5 ?v10) 
                  (pred_1 ?v1) (pred_3 ?v10 ?v1) (pred_9 ))
:effect (and (pred_2 ?v10)
   (not (pred_3 ?v10 ?v1)) (not (pred_9 ))))


(:action op_2
:parameters (?v1 ?v12 ?v3)
:precondition (and (pred_6 ?v1) (pred_5 ?v12) (pred_5 ?v3)
                  (pred_1 ?v1) (pred_2 ?v3) (pred_3 ?v12 ?v1))
:effect (and (pred_2 ?v12) (pred_3 ?v3 ?v1)
        (not (pred_2 ?v3)) (not (pred_3 ?v12 ?v1))))

(:action op_3
:parameters (?v1 ?v10)
:precondition (and (pred_6 ?v1) (pred_5 ?v10) 
                  (pred_1 ?v1) (pred_2 ?v10))
:effect (and (pred_9 ) (pred_3 ?v10 ?v1) (not (pred_2 ?v10)))))


	
