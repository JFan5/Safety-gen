(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v10 ?v3)
             (pred_1 ?v6 ?v11)
             (pred_3 ?v10 ?v11)
             (pred_10 ?v12 ?v10 )
	     (pred_6 ?v10)
             (pred_9 ?v4)
             (pred_12 ?v6)
             (pred_4 ?v11)
             (pred_2 ?v10)
             (pred_11 ?v6)
             (pred_5 ?v10)
             (pred_7 ))



(:action op_1
:parameters (?v13 ?v9 ?v1 ?v2)
:precondition (and (pred_9 ?v13) (pred_9 ?v9) (pred_12 ?v1) (pred_4 ?v2)
          (pred_8 ?v13 ?v9) (pred_1 ?v1 ?v2)
                   (pred_3 ?v9 ?v2) (pred_6 ?v13) 
                   (pred_2 ?v9) (pred_11 ?v1))
:effect (and  (pred_5 ?v9) (not (pred_2 ?v9))))


(:action op_5
:parameters (?v13 ?v8)
:precondition (and (pred_9 ?v13) (pred_9 ?v8)
               (pred_6 ?v13) (pred_8 ?v13 ?v8) (pred_5 ?v8))
:effect (and (pred_6 ?v8) (not (pred_6 ?v13))))

(:action op_2
:parameters (?v13 ?v1)
:precondition (and (pred_9 ?v13) (pred_12 ?v1) 
                  (pred_6 ?v13) (pred_10 ?v1 ?v13) (pred_7 ))
:effect (and (pred_11 ?v1)
   (not (pred_10 ?v1 ?v13)) (not (pred_7 ))))


(:action op_3
:parameters (?v13 ?v7 ?v5)
:precondition (and (pred_9 ?v13) (pred_12 ?v7) (pred_12 ?v5)
                  (pred_6 ?v13) (pred_11 ?v5) (pred_10 ?v7 ?v13))
:effect (and (pred_11 ?v7) (pred_10 ?v5 ?v13)
        (not (pred_11 ?v5)) (not (pred_10 ?v7 ?v13))))

(:action op_4
:parameters (?v13 ?v1)
:precondition (and (pred_9 ?v13) (pred_12 ?v1) 
                  (pred_6 ?v13) (pred_11 ?v1))
:effect (and (pred_7 ) (pred_10 ?v1 ?v13) (not (pred_11 ?v1)))))


	
