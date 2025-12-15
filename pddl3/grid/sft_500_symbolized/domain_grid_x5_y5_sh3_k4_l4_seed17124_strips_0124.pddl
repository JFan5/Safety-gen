(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v11 ?v4)
             (pred_8 ?v5 ?v9)
             (pred_1 ?v11 ?v9)
             (pred_9 ?v6 ?v11 )
	     (pred_11 ?v11)
             (pred_5 ?v3)
             (pred_10 ?v5)
             (pred_4 ?v9)
             (pred_2 ?v11)
             (pred_6 ?v5)
             (pred_3 ?v11)
             (pred_7 ))



(:action op_2
:parameters (?v13 ?v12 ?v8 ?v7)
:precondition (and (pred_5 ?v13) (pred_5 ?v12) (pred_10 ?v8) (pred_4 ?v7)
          (pred_12 ?v13 ?v12) (pred_8 ?v8 ?v7)
                   (pred_1 ?v12 ?v7) (pred_11 ?v13) 
                   (pred_2 ?v12) (pred_6 ?v8))
:effect (and  (pred_3 ?v12) (not (pred_2 ?v12))))


(:action op_1
:parameters (?v13 ?v2)
:precondition (and (pred_5 ?v13) (pred_5 ?v2)
               (pred_11 ?v13) (pred_12 ?v13 ?v2) (pred_3 ?v2))
:effect (and (pred_11 ?v2) (not (pred_11 ?v13))))

(:action op_5
:parameters (?v13 ?v8)
:precondition (and (pred_5 ?v13) (pred_10 ?v8) 
                  (pred_11 ?v13) (pred_9 ?v8 ?v13) (pred_7 ))
:effect (and (pred_6 ?v8)
   (not (pred_9 ?v8 ?v13)) (not (pred_7 ))))


(:action op_3
:parameters (?v13 ?v10 ?v1)
:precondition (and (pred_5 ?v13) (pred_10 ?v10) (pred_10 ?v1)
                  (pred_11 ?v13) (pred_6 ?v1) (pred_9 ?v10 ?v13))
:effect (and (pred_6 ?v10) (pred_9 ?v1 ?v13)
        (not (pred_6 ?v1)) (not (pred_9 ?v10 ?v13))))

(:action op_4
:parameters (?v13 ?v8)
:precondition (and (pred_5 ?v13) (pred_10 ?v8) 
                  (pred_11 ?v13) (pred_6 ?v8))
:effect (and (pred_7 ) (pred_9 ?v8 ?v13) (not (pred_6 ?v8)))))


	
