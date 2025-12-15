(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v5 ?v2)
             (pred_12 ?v6 ?v12)
             (pred_6 ?v5 ?v12)
             (pred_8 ?v4 ?v5 )
	     (pred_9 ?v5)
             (pred_2 ?v11)
             (pred_3 ?v6)
             (pred_5 ?v12)
             (pred_4 ?v5)
             (pred_10 ?v6)
             (pred_1 ?v5)
             (pred_7 ))



(:action op_3
:parameters (?v9 ?v13 ?v8 ?v10)
:precondition (and (pred_2 ?v9) (pred_2 ?v13) (pred_3 ?v8) (pred_5 ?v10)
          (pred_11 ?v9 ?v13) (pred_12 ?v8 ?v10)
                   (pred_6 ?v13 ?v10) (pred_9 ?v9) 
                   (pred_4 ?v13) (pred_10 ?v8))
:effect (and  (pred_1 ?v13) (not (pred_4 ?v13))))


(:action op_1
:parameters (?v9 ?v7)
:precondition (and (pred_2 ?v9) (pred_2 ?v7)
               (pred_9 ?v9) (pred_11 ?v9 ?v7) (pred_1 ?v7))
:effect (and (pred_9 ?v7) (not (pred_9 ?v9))))

(:action op_4
:parameters (?v9 ?v8)
:precondition (and (pred_2 ?v9) (pred_3 ?v8) 
                  (pred_9 ?v9) (pred_8 ?v8 ?v9) (pred_7 ))
:effect (and (pred_10 ?v8)
   (not (pred_8 ?v8 ?v9)) (not (pred_7 ))))


(:action op_2
:parameters (?v9 ?v3 ?v1)
:precondition (and (pred_2 ?v9) (pred_3 ?v3) (pred_3 ?v1)
                  (pred_9 ?v9) (pred_10 ?v1) (pred_8 ?v3 ?v9))
:effect (and (pred_10 ?v3) (pred_8 ?v1 ?v9)
        (not (pred_10 ?v1)) (not (pred_8 ?v3 ?v9))))

(:action op_5
:parameters (?v9 ?v8)
:precondition (and (pred_2 ?v9) (pred_3 ?v8) 
                  (pred_9 ?v9) (pred_10 ?v8))
:effect (and (pred_7 ) (pred_8 ?v8 ?v9) (not (pred_10 ?v8)))))


	
