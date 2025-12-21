(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v4 ?v3)
             (pred_2 ?v10 ?v2)
             (pred_12 ?v4 ?v2)
             (pred_5 ?v8 ?v4 )
	     (pred_9 ?v4)
             (pred_1 ?v7)
             (pred_10 ?v10)
             (pred_8 ?v2)
             (pred_6 ?v4)
             (pred_4 ?v10)
             (pred_11 ?v4)
             (pred_7 ))



(:action op_3
:parameters (?v9 ?v6 ?v1 ?v11)
:precondition (and (pred_1 ?v9) (pred_1 ?v6) (pred_10 ?v1) (pred_8 ?v11)
          (pred_3 ?v9 ?v6) (pred_2 ?v1 ?v11)
                   (pred_12 ?v6 ?v11) (pred_9 ?v9) 
                   (pred_6 ?v6) (pred_4 ?v1))
:effect (and  (pred_11 ?v6) (not (pred_6 ?v6))))


(:action op_2
:parameters (?v9 ?v12)
:precondition (and (pred_1 ?v9) (pred_1 ?v12)
               (pred_9 ?v9) (pred_3 ?v9 ?v12) (pred_11 ?v12))
:effect (and (pred_9 ?v12) (not (pred_9 ?v9))))

(:action op_4
:parameters (?v9 ?v1)
:precondition (and (pred_1 ?v9) (pred_10 ?v1) 
                  (pred_9 ?v9) (pred_5 ?v1 ?v9) (pred_7 ))
:effect (and (pred_4 ?v1)
   (not (pred_5 ?v1 ?v9)) (not (pred_7 ))))


(:action op_1
:parameters (?v9 ?v13 ?v5)
:precondition (and (pred_1 ?v9) (pred_10 ?v13) (pred_10 ?v5)
                  (pred_9 ?v9) (pred_4 ?v5) (pred_5 ?v13 ?v9))
:effect (and (pred_4 ?v13) (pred_5 ?v5 ?v9)
        (not (pred_4 ?v5)) (not (pred_5 ?v13 ?v9))))

(:action op_5
:parameters (?v9 ?v1)
:precondition (and (pred_1 ?v9) (pred_10 ?v1) 
                  (pred_9 ?v9) (pred_4 ?v1))
:effect (and (pred_7 ) (pred_5 ?v1 ?v9) (not (pred_4 ?v1)))))


	
