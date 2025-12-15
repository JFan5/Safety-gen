(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v12 ?v7)
             (pred_11 ?v2 ?v5)
             (pred_1 ?v12 ?v5)
             (pred_2 ?v11 ?v12 )
	     (pred_6 ?v12)
             (pred_5 ?v4)
             (pred_7 ?v2)
             (pred_8 ?v5)
             (pred_4 ?v12)
             (pred_10 ?v2)
             (pred_9 ?v12)
             (pred_3 ))



(:action op_4
:parameters (?v9 ?v13 ?v1 ?v3)
:precondition (and (pred_5 ?v9) (pred_5 ?v13) (pred_7 ?v1) (pred_8 ?v3)
          (pred_12 ?v9 ?v13) (pred_11 ?v1 ?v3)
                   (pred_1 ?v13 ?v3) (pred_6 ?v9) 
                   (pred_4 ?v13) (pred_10 ?v1))
:effect (and  (pred_9 ?v13) (not (pred_4 ?v13))))


(:action op_2
:parameters (?v9 ?v6)
:precondition (and (pred_5 ?v9) (pred_5 ?v6)
               (pred_6 ?v9) (pred_12 ?v9 ?v6) (pred_9 ?v6))
:effect (and (pred_6 ?v6) (not (pred_6 ?v9))))

(:action op_3
:parameters (?v9 ?v1)
:precondition (and (pred_5 ?v9) (pred_7 ?v1) 
                  (pred_6 ?v9) (pred_2 ?v1 ?v9) (pred_3 ))
:effect (and (pred_10 ?v1)
   (not (pred_2 ?v1 ?v9)) (not (pred_3 ))))


(:action op_1
:parameters (?v9 ?v8 ?v10)
:precondition (and (pred_5 ?v9) (pred_7 ?v8) (pred_7 ?v10)
                  (pred_6 ?v9) (pred_10 ?v10) (pred_2 ?v8 ?v9))
:effect (and (pred_10 ?v8) (pred_2 ?v10 ?v9)
        (not (pred_10 ?v10)) (not (pred_2 ?v8 ?v9))))

(:action op_5
:parameters (?v9 ?v1)
:precondition (and (pred_5 ?v9) (pred_7 ?v1) 
                  (pred_6 ?v9) (pred_10 ?v1))
:effect (and (pred_3 ) (pred_2 ?v1 ?v9) (not (pred_10 ?v1)))))


	
