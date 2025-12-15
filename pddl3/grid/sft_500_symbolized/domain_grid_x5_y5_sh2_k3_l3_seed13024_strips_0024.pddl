(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v12 ?v4)
             (pred_3 ?v8 ?v10)
             (pred_8 ?v12 ?v10)
             (pred_12 ?v2 ?v12 )
	     (pred_1 ?v12)
             (pred_4 ?v1)
             (pred_7 ?v8)
             (pred_2 ?v10)
             (pred_5 ?v12)
             (pred_9 ?v8)
             (pred_11 ?v12)
             (pred_6 ))



(:action op_3
:parameters (?v9 ?v13 ?v11 ?v7)
:precondition (and (pred_4 ?v9) (pred_4 ?v13) (pred_7 ?v11) (pred_2 ?v7)
          (pred_10 ?v9 ?v13) (pred_3 ?v11 ?v7)
                   (pred_8 ?v13 ?v7) (pred_1 ?v9) 
                   (pred_5 ?v13) (pred_9 ?v11))
:effect (and  (pred_11 ?v13) (not (pred_5 ?v13))))


(:action op_4
:parameters (?v9 ?v5)
:precondition (and (pred_4 ?v9) (pred_4 ?v5)
               (pred_1 ?v9) (pred_10 ?v9 ?v5) (pred_11 ?v5))
:effect (and (pred_1 ?v5) (not (pred_1 ?v9))))

(:action op_5
:parameters (?v9 ?v11)
:precondition (and (pred_4 ?v9) (pred_7 ?v11) 
                  (pred_1 ?v9) (pred_12 ?v11 ?v9) (pred_6 ))
:effect (and (pred_9 ?v11)
   (not (pred_12 ?v11 ?v9)) (not (pred_6 ))))


(:action op_1
:parameters (?v9 ?v3 ?v6)
:precondition (and (pred_4 ?v9) (pred_7 ?v3) (pred_7 ?v6)
                  (pred_1 ?v9) (pred_9 ?v6) (pred_12 ?v3 ?v9))
:effect (and (pred_9 ?v3) (pred_12 ?v6 ?v9)
        (not (pred_9 ?v6)) (not (pred_12 ?v3 ?v9))))

(:action op_2
:parameters (?v9 ?v11)
:precondition (and (pred_4 ?v9) (pred_7 ?v11) 
                  (pred_1 ?v9) (pred_9 ?v11))
:effect (and (pred_6 ) (pred_12 ?v11 ?v9) (not (pred_9 ?v11)))))


	
