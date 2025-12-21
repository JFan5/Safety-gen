(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v5 ?v1)
             (pred_11 ?v4 ?v7)
             (pred_8 ?v5 ?v7)
             (pred_1 ?v8 ?v5 )
	     (pred_12 ?v5)
             (pred_10 ?v2)
             (pred_4 ?v4)
             (pred_7 ?v7)
             (pred_9 ?v5)
             (pred_2 ?v4)
             (pred_6 ?v5)
             (pred_5 ))



(:action op_1
:parameters (?v9 ?v13 ?v3 ?v11)
:precondition (and (pred_10 ?v9) (pred_10 ?v13) (pred_4 ?v3) (pred_7 ?v11)
          (pred_3 ?v9 ?v13) (pred_11 ?v3 ?v11)
                   (pred_8 ?v13 ?v11) (pred_12 ?v9) 
                   (pred_9 ?v13) (pred_2 ?v3))
:effect (and  (pred_6 ?v13) (not (pred_9 ?v13))))


(:action op_5
:parameters (?v9 ?v10)
:precondition (and (pred_10 ?v9) (pred_10 ?v10)
               (pred_12 ?v9) (pred_3 ?v9 ?v10) (pred_6 ?v10))
:effect (and (pred_12 ?v10) (not (pred_12 ?v9))))

(:action op_2
:parameters (?v9 ?v3)
:precondition (and (pred_10 ?v9) (pred_4 ?v3) 
                  (pred_12 ?v9) (pred_1 ?v3 ?v9) (pred_5 ))
:effect (and (pred_2 ?v3)
   (not (pred_1 ?v3 ?v9)) (not (pred_5 ))))


(:action op_4
:parameters (?v9 ?v12 ?v6)
:precondition (and (pred_10 ?v9) (pred_4 ?v12) (pred_4 ?v6)
                  (pred_12 ?v9) (pred_2 ?v6) (pred_1 ?v12 ?v9))
:effect (and (pred_2 ?v12) (pred_1 ?v6 ?v9)
        (not (pred_2 ?v6)) (not (pred_1 ?v12 ?v9))))

(:action op_3
:parameters (?v9 ?v3)
:precondition (and (pred_10 ?v9) (pred_4 ?v3) 
                  (pred_12 ?v9) (pred_2 ?v3))
:effect (and (pred_5 ) (pred_1 ?v3 ?v9) (not (pred_2 ?v3)))))


	
