(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v6 ?v9)
             (pred_1 ?v2 ?v1)
             (pred_3 ?v6 ?v1)
             (pred_6 ?v3 ?v6 )
	     (pred_12 ?v6)
             (pred_10 ?v13)
             (pred_11 ?v2)
             (pred_9 ?v1)
             (pred_8 ?v6)
             (pred_5 ?v2)
             (pred_2 ?v6)
             (pred_4 ))



(:action op_1
:parameters (?v8 ?v7 ?v4 ?v12)
:precondition (and (pred_10 ?v8) (pred_10 ?v7) (pred_11 ?v4) (pred_9 ?v12)
          (pred_7 ?v8 ?v7) (pred_1 ?v4 ?v12)
                   (pred_3 ?v7 ?v12) (pred_12 ?v8) 
                   (pred_8 ?v7) (pred_5 ?v4))
:effect (and  (pred_2 ?v7) (not (pred_8 ?v7))))


(:action op_2
:parameters (?v8 ?v5)
:precondition (and (pred_10 ?v8) (pred_10 ?v5)
               (pred_12 ?v8) (pred_7 ?v8 ?v5) (pred_2 ?v5))
:effect (and (pred_12 ?v5) (not (pred_12 ?v8))))

(:action op_4
:parameters (?v8 ?v4)
:precondition (and (pred_10 ?v8) (pred_11 ?v4) 
                  (pred_12 ?v8) (pred_6 ?v4 ?v8) (pred_4 ))
:effect (and (pred_5 ?v4)
   (not (pred_6 ?v4 ?v8)) (not (pred_4 ))))


(:action op_5
:parameters (?v8 ?v10 ?v11)
:precondition (and (pred_10 ?v8) (pred_11 ?v10) (pred_11 ?v11)
                  (pred_12 ?v8) (pred_5 ?v11) (pred_6 ?v10 ?v8))
:effect (and (pred_5 ?v10) (pred_6 ?v11 ?v8)
        (not (pred_5 ?v11)) (not (pred_6 ?v10 ?v8))))

(:action op_3
:parameters (?v8 ?v4)
:precondition (and (pred_10 ?v8) (pred_11 ?v4) 
                  (pred_12 ?v8) (pred_5 ?v4))
:effect (and (pred_4 ) (pred_6 ?v4 ?v8) (not (pred_5 ?v4)))))


	
