(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v13 ?v9)
             (pred_2 ?v2 ?v3)
             (pred_6 ?v13 ?v3)
             (pred_9 ?v12 ?v13 )
	     (pred_11 ?v13)
             (pred_10 ?v1)
             (pred_8 ?v2)
             (pred_12 ?v3)
             (pred_3 ?v13)
             (pred_1 ?v2)
             (pred_5 ?v13)
             (pred_4 ))



(:action op_5
:parameters (?v10 ?v11 ?v4 ?v6)
:precondition (and (pred_10 ?v10) (pred_10 ?v11) (pred_8 ?v4) (pred_12 ?v6)
          (pred_7 ?v10 ?v11) (pred_2 ?v4 ?v6)
                   (pred_6 ?v11 ?v6) (pred_11 ?v10) 
                   (pred_3 ?v11) (pred_1 ?v4))
:effect (and  (pred_5 ?v11) (not (pred_3 ?v11))))


(:action op_2
:parameters (?v10 ?v5)
:precondition (and (pred_10 ?v10) (pred_10 ?v5)
               (pred_11 ?v10) (pred_7 ?v10 ?v5) (pred_5 ?v5))
:effect (and (pred_11 ?v5) (not (pred_11 ?v10))))

(:action op_1
:parameters (?v10 ?v4)
:precondition (and (pred_10 ?v10) (pred_8 ?v4) 
                  (pred_11 ?v10) (pred_9 ?v4 ?v10) (pred_4 ))
:effect (and (pred_1 ?v4)
   (not (pred_9 ?v4 ?v10)) (not (pred_4 ))))


(:action op_3
:parameters (?v10 ?v7 ?v8)
:precondition (and (pred_10 ?v10) (pred_8 ?v7) (pred_8 ?v8)
                  (pred_11 ?v10) (pred_1 ?v8) (pred_9 ?v7 ?v10))
:effect (and (pred_1 ?v7) (pred_9 ?v8 ?v10)
        (not (pred_1 ?v8)) (not (pred_9 ?v7 ?v10))))

(:action op_4
:parameters (?v10 ?v4)
:precondition (and (pred_10 ?v10) (pred_8 ?v4) 
                  (pred_11 ?v10) (pred_1 ?v4))
:effect (and (pred_4 ) (pred_9 ?v4 ?v10) (not (pred_1 ?v4)))))


	
