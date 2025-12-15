(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v11 ?v10)
             (pred_2 ?v5 ?v7)
             (pred_11 ?v11 ?v7)
             (pred_12 ?v2 ?v11 )
	     (pred_7 ?v11)
             (pred_9 ?v9)
             (pred_3 ?v5)
             (pred_5 ?v7)
             (pred_4 ?v11)
             (pred_10 ?v5)
             (pred_1 ?v11)
             (pred_6 ))



(:action op_2
:parameters (?v13 ?v12 ?v8 ?v6)
:precondition (and (pred_9 ?v13) (pred_9 ?v12) (pred_3 ?v8) (pred_5 ?v6)
          (pred_8 ?v13 ?v12) (pred_2 ?v8 ?v6)
                   (pred_11 ?v12 ?v6) (pred_7 ?v13) 
                   (pred_4 ?v12) (pred_10 ?v8))
:effect (and  (pred_1 ?v12) (not (pred_4 ?v12))))


(:action op_5
:parameters (?v13 ?v4)
:precondition (and (pred_9 ?v13) (pred_9 ?v4)
               (pred_7 ?v13) (pred_8 ?v13 ?v4) (pred_1 ?v4))
:effect (and (pred_7 ?v4) (not (pred_7 ?v13))))

(:action op_1
:parameters (?v13 ?v8)
:precondition (and (pred_9 ?v13) (pred_3 ?v8) 
                  (pred_7 ?v13) (pred_12 ?v8 ?v13) (pred_6 ))
:effect (and (pred_10 ?v8)
   (not (pred_12 ?v8 ?v13)) (not (pred_6 ))))


(:action op_4
:parameters (?v13 ?v3 ?v1)
:precondition (and (pred_9 ?v13) (pred_3 ?v3) (pred_3 ?v1)
                  (pred_7 ?v13) (pred_10 ?v1) (pred_12 ?v3 ?v13))
:effect (and (pred_10 ?v3) (pred_12 ?v1 ?v13)
        (not (pred_10 ?v1)) (not (pred_12 ?v3 ?v13))))

(:action op_3
:parameters (?v13 ?v8)
:precondition (and (pred_9 ?v13) (pred_3 ?v8) 
                  (pred_7 ?v13) (pred_10 ?v8))
:effect (and (pred_6 ) (pred_12 ?v8 ?v13) (not (pred_10 ?v8)))))


	
