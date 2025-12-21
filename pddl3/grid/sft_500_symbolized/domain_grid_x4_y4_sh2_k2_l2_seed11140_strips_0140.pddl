(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v6 ?v12)
             (pred_4 ?v8 ?v11)
             (pred_8 ?v6 ?v11)
             (pred_5 ?v13 ?v6 )
	     (pred_2 ?v6)
             (pred_10 ?v1)
             (pred_1 ?v8)
             (pred_12 ?v11)
             (pred_11 ?v6)
             (pred_9 ?v8)
             (pred_3 ?v6)
             (pred_7 ))



(:action op_3
:parameters (?v10 ?v5 ?v7 ?v3)
:precondition (and (pred_10 ?v10) (pred_10 ?v5) (pred_1 ?v7) (pred_12 ?v3)
          (pred_6 ?v10 ?v5) (pred_4 ?v7 ?v3)
                   (pred_8 ?v5 ?v3) (pred_2 ?v10) 
                   (pred_11 ?v5) (pred_9 ?v7))
:effect (and  (pred_3 ?v5) (not (pred_11 ?v5))))


(:action op_5
:parameters (?v10 ?v4)
:precondition (and (pred_10 ?v10) (pred_10 ?v4)
               (pred_2 ?v10) (pred_6 ?v10 ?v4) (pred_3 ?v4))
:effect (and (pred_2 ?v4) (not (pred_2 ?v10))))

(:action op_2
:parameters (?v10 ?v7)
:precondition (and (pred_10 ?v10) (pred_1 ?v7) 
                  (pred_2 ?v10) (pred_5 ?v7 ?v10) (pred_7 ))
:effect (and (pred_9 ?v7)
   (not (pred_5 ?v7 ?v10)) (not (pred_7 ))))


(:action op_4
:parameters (?v10 ?v9 ?v2)
:precondition (and (pred_10 ?v10) (pred_1 ?v9) (pred_1 ?v2)
                  (pred_2 ?v10) (pred_9 ?v2) (pred_5 ?v9 ?v10))
:effect (and (pred_9 ?v9) (pred_5 ?v2 ?v10)
        (not (pred_9 ?v2)) (not (pred_5 ?v9 ?v10))))

(:action op_1
:parameters (?v10 ?v7)
:precondition (and (pred_10 ?v10) (pred_1 ?v7) 
                  (pred_2 ?v10) (pred_9 ?v7))
:effect (and (pred_7 ) (pred_5 ?v7 ?v10) (not (pred_9 ?v7)))))


	
