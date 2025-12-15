(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v6 ?v3)
             (pred_6 ?v1 ?v4)
             (pred_9 ?v6 ?v4)
             (pred_4 ?v13 ?v6 )
	     (pred_7 ?v6)
             (pred_5 ?v2)
             (pred_2 ?v1)
             (pred_1 ?v4)
             (pred_3 ?v6)
             (pred_8 ?v1)
             (pred_10 ?v6)
             (pred_12 ))



(:action op_3
:parameters (?v9 ?v8 ?v12 ?v7)
:precondition (and (pred_5 ?v9) (pred_5 ?v8) (pred_2 ?v12) (pred_1 ?v7)
          (pred_11 ?v9 ?v8) (pred_6 ?v12 ?v7)
                   (pred_9 ?v8 ?v7) (pred_7 ?v9) 
                   (pred_3 ?v8) (pred_8 ?v12))
:effect (and  (pred_10 ?v8) (not (pred_3 ?v8))))


(:action op_1
:parameters (?v9 ?v5)
:precondition (and (pred_5 ?v9) (pred_5 ?v5)
               (pred_7 ?v9) (pred_11 ?v9 ?v5) (pred_10 ?v5))
:effect (and (pred_7 ?v5) (not (pred_7 ?v9))))

(:action op_4
:parameters (?v9 ?v12)
:precondition (and (pred_5 ?v9) (pred_2 ?v12) 
                  (pred_7 ?v9) (pred_4 ?v12 ?v9) (pred_12 ))
:effect (and (pred_8 ?v12)
   (not (pred_4 ?v12 ?v9)) (not (pred_12 ))))


(:action op_5
:parameters (?v9 ?v11 ?v10)
:precondition (and (pred_5 ?v9) (pred_2 ?v11) (pred_2 ?v10)
                  (pred_7 ?v9) (pred_8 ?v10) (pred_4 ?v11 ?v9))
:effect (and (pred_8 ?v11) (pred_4 ?v10 ?v9)
        (not (pred_8 ?v10)) (not (pred_4 ?v11 ?v9))))

(:action op_2
:parameters (?v9 ?v12)
:precondition (and (pred_5 ?v9) (pred_2 ?v12) 
                  (pred_7 ?v9) (pred_8 ?v12))
:effect (and (pred_12 ) (pred_4 ?v12 ?v9) (not (pred_8 ?v12)))))


	
