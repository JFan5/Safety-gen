(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v4 ?v2)
             (pred_11 ?v5 ?v10)
             (pred_5 ?v4 ?v10)
             (pred_1 ?v3 ?v4 )
	     (pred_2 ?v4)
             (pred_4 ?v9)
             (pred_7 ?v5)
             (pred_9 ?v10)
             (pred_12 ?v4)
             (pred_6 ?v5)
             (pred_3 ?v4)
             (pred_10 ))



(:action op_4
:parameters (?v1 ?v13 ?v12 ?v11)
:precondition (and (pred_4 ?v1) (pred_4 ?v13) (pred_7 ?v12) (pred_9 ?v11)
          (pred_8 ?v1 ?v13) (pred_11 ?v12 ?v11)
                   (pred_5 ?v13 ?v11) (pred_2 ?v1) 
                   (pred_12 ?v13) (pred_6 ?v12))
:effect (and  (pred_3 ?v13) (not (pred_12 ?v13))))


(:action op_2
:parameters (?v1 ?v6)
:precondition (and (pred_4 ?v1) (pred_4 ?v6)
               (pred_2 ?v1) (pred_8 ?v1 ?v6) (pred_3 ?v6))
:effect (and (pred_2 ?v6) (not (pred_2 ?v1))))

(:action op_3
:parameters (?v1 ?v12)
:precondition (and (pred_4 ?v1) (pred_7 ?v12) 
                  (pred_2 ?v1) (pred_1 ?v12 ?v1) (pred_10 ))
:effect (and (pred_6 ?v12)
   (not (pred_1 ?v12 ?v1)) (not (pred_10 ))))


(:action op_5
:parameters (?v1 ?v8 ?v7)
:precondition (and (pred_4 ?v1) (pred_7 ?v8) (pred_7 ?v7)
                  (pred_2 ?v1) (pred_6 ?v7) (pred_1 ?v8 ?v1))
:effect (and (pred_6 ?v8) (pred_1 ?v7 ?v1)
        (not (pred_6 ?v7)) (not (pred_1 ?v8 ?v1))))

(:action op_1
:parameters (?v1 ?v12)
:precondition (and (pred_4 ?v1) (pred_7 ?v12) 
                  (pred_2 ?v1) (pred_6 ?v12))
:effect (and (pred_10 ) (pred_1 ?v12 ?v1) (not (pred_6 ?v12)))))


	
