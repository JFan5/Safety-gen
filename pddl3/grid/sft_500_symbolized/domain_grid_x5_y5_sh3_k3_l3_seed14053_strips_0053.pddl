(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v6 ?v3)
             (pred_6 ?v4 ?v11)
             (pred_1 ?v6 ?v11)
             (pred_4 ?v8 ?v6 )
	     (pred_2 ?v6)
             (pred_5 ?v1)
             (pred_11 ?v4)
             (pred_10 ?v11)
             (pred_7 ?v6)
             (pred_9 ?v4)
             (pred_3 ?v6)
             (pred_12 ))



(:action op_4
:parameters (?v9 ?v7 ?v10 ?v12)
:precondition (and (pred_5 ?v9) (pred_5 ?v7) (pred_11 ?v10) (pred_10 ?v12)
          (pred_8 ?v9 ?v7) (pred_6 ?v10 ?v12)
                   (pred_1 ?v7 ?v12) (pred_2 ?v9) 
                   (pred_7 ?v7) (pred_9 ?v10))
:effect (and  (pred_3 ?v7) (not (pred_7 ?v7))))


(:action op_2
:parameters (?v9 ?v5)
:precondition (and (pred_5 ?v9) (pred_5 ?v5)
               (pred_2 ?v9) (pred_8 ?v9 ?v5) (pred_3 ?v5))
:effect (and (pred_2 ?v5) (not (pred_2 ?v9))))

(:action op_5
:parameters (?v9 ?v10)
:precondition (and (pred_5 ?v9) (pred_11 ?v10) 
                  (pred_2 ?v9) (pred_4 ?v10 ?v9) (pred_12 ))
:effect (and (pred_9 ?v10)
   (not (pred_4 ?v10 ?v9)) (not (pred_12 ))))


(:action op_1
:parameters (?v9 ?v2 ?v13)
:precondition (and (pred_5 ?v9) (pred_11 ?v2) (pred_11 ?v13)
                  (pred_2 ?v9) (pred_9 ?v13) (pred_4 ?v2 ?v9))
:effect (and (pred_9 ?v2) (pred_4 ?v13 ?v9)
        (not (pred_9 ?v13)) (not (pred_4 ?v2 ?v9))))

(:action op_3
:parameters (?v9 ?v10)
:precondition (and (pred_5 ?v9) (pred_11 ?v10) 
                  (pred_2 ?v9) (pred_9 ?v10))
:effect (and (pred_12 ) (pred_4 ?v10 ?v9) (not (pred_9 ?v10)))))


	
