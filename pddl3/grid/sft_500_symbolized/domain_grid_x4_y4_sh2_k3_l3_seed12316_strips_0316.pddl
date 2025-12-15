(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v4 ?v11)
             (pred_9 ?v2 ?v6)
             (pred_5 ?v4 ?v6)
             (pred_10 ?v13 ?v4 )
	     (pred_3 ?v4)
             (pred_7 ?v5)
             (pred_4 ?v2)
             (pred_8 ?v6)
             (pred_1 ?v4)
             (pred_12 ?v2)
             (pred_2 ?v4)
             (pred_11 ))



(:action op_2
:parameters (?v9 ?v12 ?v10 ?v1)
:precondition (and (pred_7 ?v9) (pred_7 ?v12) (pred_4 ?v10) (pred_8 ?v1)
          (pred_6 ?v9 ?v12) (pred_9 ?v10 ?v1)
                   (pred_5 ?v12 ?v1) (pred_3 ?v9) 
                   (pred_1 ?v12) (pred_12 ?v10))
:effect (and  (pred_2 ?v12) (not (pred_1 ?v12))))


(:action op_3
:parameters (?v9 ?v7)
:precondition (and (pred_7 ?v9) (pred_7 ?v7)
               (pred_3 ?v9) (pred_6 ?v9 ?v7) (pred_2 ?v7))
:effect (and (pred_3 ?v7) (not (pred_3 ?v9))))

(:action op_4
:parameters (?v9 ?v10)
:precondition (and (pred_7 ?v9) (pred_4 ?v10) 
                  (pred_3 ?v9) (pred_10 ?v10 ?v9) (pred_11 ))
:effect (and (pred_12 ?v10)
   (not (pred_10 ?v10 ?v9)) (not (pred_11 ))))


(:action op_5
:parameters (?v9 ?v8 ?v3)
:precondition (and (pred_7 ?v9) (pred_4 ?v8) (pred_4 ?v3)
                  (pred_3 ?v9) (pred_12 ?v3) (pred_10 ?v8 ?v9))
:effect (and (pred_12 ?v8) (pred_10 ?v3 ?v9)
        (not (pred_12 ?v3)) (not (pred_10 ?v8 ?v9))))

(:action op_1
:parameters (?v9 ?v10)
:precondition (and (pred_7 ?v9) (pred_4 ?v10) 
                  (pred_3 ?v9) (pred_12 ?v10))
:effect (and (pred_11 ) (pred_10 ?v10 ?v9) (not (pred_12 ?v10)))))


	
