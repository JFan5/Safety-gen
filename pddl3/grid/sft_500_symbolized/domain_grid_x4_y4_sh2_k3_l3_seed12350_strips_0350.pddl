(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v2 ?v11)
             (pred_9 ?v3 ?v10)
             (pred_7 ?v2 ?v10)
             (pred_5 ?v7 ?v2 )
	     (pred_3 ?v2)
             (pred_8 ?v1)
             (pred_12 ?v3)
             (pred_11 ?v10)
             (pred_1 ?v2)
             (pred_4 ?v3)
             (pred_6 ?v2)
             (pred_2 ))



(:action op_1
:parameters (?v9 ?v8 ?v6 ?v4)
:precondition (and (pred_8 ?v9) (pred_8 ?v8) (pred_12 ?v6) (pred_11 ?v4)
          (pred_10 ?v9 ?v8) (pred_9 ?v6 ?v4)
                   (pred_7 ?v8 ?v4) (pred_3 ?v9) 
                   (pred_1 ?v8) (pred_4 ?v6))
:effect (and  (pred_6 ?v8) (not (pred_1 ?v8))))


(:action op_4
:parameters (?v9 ?v12)
:precondition (and (pred_8 ?v9) (pred_8 ?v12)
               (pred_3 ?v9) (pred_10 ?v9 ?v12) (pred_6 ?v12))
:effect (and (pred_3 ?v12) (not (pred_3 ?v9))))

(:action op_2
:parameters (?v9 ?v6)
:precondition (and (pred_8 ?v9) (pred_12 ?v6) 
                  (pred_3 ?v9) (pred_5 ?v6 ?v9) (pred_2 ))
:effect (and (pred_4 ?v6)
   (not (pred_5 ?v6 ?v9)) (not (pred_2 ))))


(:action op_3
:parameters (?v9 ?v13 ?v5)
:precondition (and (pred_8 ?v9) (pred_12 ?v13) (pred_12 ?v5)
                  (pred_3 ?v9) (pred_4 ?v5) (pred_5 ?v13 ?v9))
:effect (and (pred_4 ?v13) (pred_5 ?v5 ?v9)
        (not (pred_4 ?v5)) (not (pred_5 ?v13 ?v9))))

(:action op_5
:parameters (?v9 ?v6)
:precondition (and (pred_8 ?v9) (pred_12 ?v6) 
                  (pred_3 ?v9) (pred_4 ?v6))
:effect (and (pred_2 ) (pred_5 ?v6 ?v9) (not (pred_4 ?v6)))))


	
