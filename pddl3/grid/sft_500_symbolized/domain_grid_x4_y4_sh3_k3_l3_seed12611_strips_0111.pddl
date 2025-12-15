(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v11 ?v4)
             (pred_9 ?v12 ?v5)
             (pred_12 ?v11 ?v5)
             (pred_6 ?v10 ?v11 )
	     (pred_5 ?v11)
             (pred_11 ?v2)
             (pred_3 ?v12)
             (pred_7 ?v5)
             (pred_8 ?v11)
             (pred_1 ?v12)
             (pred_10 ?v11)
             (pred_4 ))



(:action op_5
:parameters (?v9 ?v8 ?v6 ?v13)
:precondition (and (pred_11 ?v9) (pred_11 ?v8) (pred_3 ?v6) (pred_7 ?v13)
          (pred_2 ?v9 ?v8) (pred_9 ?v6 ?v13)
                   (pred_12 ?v8 ?v13) (pred_5 ?v9) 
                   (pred_8 ?v8) (pred_1 ?v6))
:effect (and  (pred_10 ?v8) (not (pred_8 ?v8))))


(:action op_2
:parameters (?v9 ?v1)
:precondition (and (pred_11 ?v9) (pred_11 ?v1)
               (pred_5 ?v9) (pred_2 ?v9 ?v1) (pred_10 ?v1))
:effect (and (pred_5 ?v1) (not (pred_5 ?v9))))

(:action op_4
:parameters (?v9 ?v6)
:precondition (and (pred_11 ?v9) (pred_3 ?v6) 
                  (pred_5 ?v9) (pred_6 ?v6 ?v9) (pred_4 ))
:effect (and (pred_1 ?v6)
   (not (pred_6 ?v6 ?v9)) (not (pred_4 ))))


(:action op_1
:parameters (?v9 ?v7 ?v3)
:precondition (and (pred_11 ?v9) (pred_3 ?v7) (pred_3 ?v3)
                  (pred_5 ?v9) (pred_1 ?v3) (pred_6 ?v7 ?v9))
:effect (and (pred_1 ?v7) (pred_6 ?v3 ?v9)
        (not (pred_1 ?v3)) (not (pred_6 ?v7 ?v9))))

(:action op_3
:parameters (?v9 ?v6)
:precondition (and (pred_11 ?v9) (pred_3 ?v6) 
                  (pred_5 ?v9) (pred_1 ?v6))
:effect (and (pred_4 ) (pred_6 ?v6 ?v9) (not (pred_1 ?v6)))))


	
