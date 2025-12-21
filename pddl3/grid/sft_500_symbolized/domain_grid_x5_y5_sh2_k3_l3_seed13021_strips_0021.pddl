(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v6 ?v1)
             (pred_12 ?v3 ?v10)
             (pred_10 ?v6 ?v10)
             (pred_6 ?v7 ?v6 )
	     (pred_11 ?v6)
             (pred_7 ?v2)
             (pred_5 ?v3)
             (pred_3 ?v10)
             (pred_4 ?v6)
             (pred_9 ?v3)
             (pred_1 ?v6)
             (pred_8 ))



(:action op_4
:parameters (?v9 ?v13 ?v12 ?v11)
:precondition (and (pred_7 ?v9) (pred_7 ?v13) (pred_5 ?v12) (pred_3 ?v11)
          (pred_2 ?v9 ?v13) (pred_12 ?v12 ?v11)
                   (pred_10 ?v13 ?v11) (pred_11 ?v9) 
                   (pred_4 ?v13) (pred_9 ?v12))
:effect (and  (pred_1 ?v13) (not (pred_4 ?v13))))


(:action op_3
:parameters (?v9 ?v8)
:precondition (and (pred_7 ?v9) (pred_7 ?v8)
               (pred_11 ?v9) (pred_2 ?v9 ?v8) (pred_1 ?v8))
:effect (and (pred_11 ?v8) (not (pred_11 ?v9))))

(:action op_5
:parameters (?v9 ?v12)
:precondition (and (pred_7 ?v9) (pred_5 ?v12) 
                  (pred_11 ?v9) (pred_6 ?v12 ?v9) (pred_8 ))
:effect (and (pred_9 ?v12)
   (not (pred_6 ?v12 ?v9)) (not (pred_8 ))))


(:action op_2
:parameters (?v9 ?v4 ?v5)
:precondition (and (pred_7 ?v9) (pred_5 ?v4) (pred_5 ?v5)
                  (pred_11 ?v9) (pred_9 ?v5) (pred_6 ?v4 ?v9))
:effect (and (pred_9 ?v4) (pred_6 ?v5 ?v9)
        (not (pred_9 ?v5)) (not (pred_6 ?v4 ?v9))))

(:action op_1
:parameters (?v9 ?v12)
:precondition (and (pred_7 ?v9) (pred_5 ?v12) 
                  (pred_11 ?v9) (pred_9 ?v12))
:effect (and (pred_8 ) (pred_6 ?v12 ?v9) (not (pred_9 ?v12)))))


	
