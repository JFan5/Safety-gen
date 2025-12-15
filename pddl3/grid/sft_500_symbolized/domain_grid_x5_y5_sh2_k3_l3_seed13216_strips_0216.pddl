(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v4 ?v9)
             (pred_6 ?v11 ?v6)
             (pred_1 ?v4 ?v6)
             (pred_2 ?v3 ?v4 )
	     (pred_3 ?v4)
             (pred_11 ?v2)
             (pred_8 ?v11)
             (pred_5 ?v6)
             (pred_7 ?v4)
             (pred_12 ?v11)
             (pred_4 ?v4)
             (pred_9 ))



(:action op_5
:parameters (?v13 ?v8 ?v5 ?v7)
:precondition (and (pred_11 ?v13) (pred_11 ?v8) (pred_8 ?v5) (pred_5 ?v7)
          (pred_10 ?v13 ?v8) (pred_6 ?v5 ?v7)
                   (pred_1 ?v8 ?v7) (pred_3 ?v13) 
                   (pred_7 ?v8) (pred_12 ?v5))
:effect (and  (pred_4 ?v8) (not (pred_7 ?v8))))


(:action op_4
:parameters (?v13 ?v12)
:precondition (and (pred_11 ?v13) (pred_11 ?v12)
               (pred_3 ?v13) (pred_10 ?v13 ?v12) (pred_4 ?v12))
:effect (and (pred_3 ?v12) (not (pred_3 ?v13))))

(:action op_2
:parameters (?v13 ?v5)
:precondition (and (pred_11 ?v13) (pred_8 ?v5) 
                  (pred_3 ?v13) (pred_2 ?v5 ?v13) (pred_9 ))
:effect (and (pred_12 ?v5)
   (not (pred_2 ?v5 ?v13)) (not (pred_9 ))))


(:action op_3
:parameters (?v13 ?v10 ?v1)
:precondition (and (pred_11 ?v13) (pred_8 ?v10) (pred_8 ?v1)
                  (pred_3 ?v13) (pred_12 ?v1) (pred_2 ?v10 ?v13))
:effect (and (pred_12 ?v10) (pred_2 ?v1 ?v13)
        (not (pred_12 ?v1)) (not (pred_2 ?v10 ?v13))))

(:action op_1
:parameters (?v13 ?v5)
:precondition (and (pred_11 ?v13) (pred_8 ?v5) 
                  (pred_3 ?v13) (pred_12 ?v5))
:effect (and (pred_9 ) (pred_2 ?v5 ?v13) (not (pred_12 ?v5)))))


	
