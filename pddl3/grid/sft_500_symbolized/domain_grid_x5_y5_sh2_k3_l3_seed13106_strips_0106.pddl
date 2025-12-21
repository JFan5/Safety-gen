(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v4 ?v1)
             (pred_3 ?v5 ?v12)
             (pred_5 ?v4 ?v12)
             (pred_11 ?v2 ?v4 )
	     (pred_2 ?v4)
             (pred_4 ?v13)
             (pred_12 ?v5)
             (pred_7 ?v12)
             (pred_8 ?v4)
             (pred_10 ?v5)
             (pred_9 ?v4)
             (pred_6 ))



(:action op_5
:parameters (?v8 ?v7 ?v6 ?v3)
:precondition (and (pred_4 ?v8) (pred_4 ?v7) (pred_12 ?v6) (pred_7 ?v3)
          (pred_1 ?v8 ?v7) (pred_3 ?v6 ?v3)
                   (pred_5 ?v7 ?v3) (pred_2 ?v8) 
                   (pred_8 ?v7) (pred_10 ?v6))
:effect (and  (pred_9 ?v7) (not (pred_8 ?v7))))


(:action op_2
:parameters (?v8 ?v11)
:precondition (and (pred_4 ?v8) (pred_4 ?v11)
               (pred_2 ?v8) (pred_1 ?v8 ?v11) (pred_9 ?v11))
:effect (and (pred_2 ?v11) (not (pred_2 ?v8))))

(:action op_1
:parameters (?v8 ?v6)
:precondition (and (pred_4 ?v8) (pred_12 ?v6) 
                  (pred_2 ?v8) (pred_11 ?v6 ?v8) (pred_6 ))
:effect (and (pred_10 ?v6)
   (not (pred_11 ?v6 ?v8)) (not (pred_6 ))))


(:action op_3
:parameters (?v8 ?v10 ?v9)
:precondition (and (pred_4 ?v8) (pred_12 ?v10) (pred_12 ?v9)
                  (pred_2 ?v8) (pred_10 ?v9) (pred_11 ?v10 ?v8))
:effect (and (pred_10 ?v10) (pred_11 ?v9 ?v8)
        (not (pred_10 ?v9)) (not (pred_11 ?v10 ?v8))))

(:action op_4
:parameters (?v8 ?v6)
:precondition (and (pred_4 ?v8) (pred_12 ?v6) 
                  (pred_2 ?v8) (pred_10 ?v6))
:effect (and (pred_6 ) (pred_11 ?v6 ?v8) (not (pred_10 ?v6)))))


	
