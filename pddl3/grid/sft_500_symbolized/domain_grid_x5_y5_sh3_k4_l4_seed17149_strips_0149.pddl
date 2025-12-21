(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v2 ?v1)
             (pred_4 ?v9 ?v12)
             (pred_5 ?v2 ?v12)
             (pred_6 ?v6 ?v2 )
	     (pred_3 ?v2)
             (pred_10 ?v11)
             (pred_2 ?v9)
             (pred_1 ?v12)
             (pred_11 ?v2)
             (pred_8 ?v9)
             (pred_9 ?v2)
             (pred_7 ))



(:action op_2
:parameters (?v10 ?v13 ?v7 ?v8)
:precondition (and (pred_10 ?v10) (pred_10 ?v13) (pred_2 ?v7) (pred_1 ?v8)
          (pred_12 ?v10 ?v13) (pred_4 ?v7 ?v8)
                   (pred_5 ?v13 ?v8) (pred_3 ?v10) 
                   (pred_11 ?v13) (pred_8 ?v7))
:effect (and  (pred_9 ?v13) (not (pred_11 ?v13))))


(:action op_3
:parameters (?v10 ?v3)
:precondition (and (pred_10 ?v10) (pred_10 ?v3)
               (pred_3 ?v10) (pred_12 ?v10 ?v3) (pred_9 ?v3))
:effect (and (pred_3 ?v3) (not (pred_3 ?v10))))

(:action op_1
:parameters (?v10 ?v7)
:precondition (and (pred_10 ?v10) (pred_2 ?v7) 
                  (pred_3 ?v10) (pred_6 ?v7 ?v10) (pred_7 ))
:effect (and (pred_8 ?v7)
   (not (pred_6 ?v7 ?v10)) (not (pred_7 ))))


(:action op_5
:parameters (?v10 ?v5 ?v4)
:precondition (and (pred_10 ?v10) (pred_2 ?v5) (pred_2 ?v4)
                  (pred_3 ?v10) (pred_8 ?v4) (pred_6 ?v5 ?v10))
:effect (and (pred_8 ?v5) (pred_6 ?v4 ?v10)
        (not (pred_8 ?v4)) (not (pred_6 ?v5 ?v10))))

(:action op_4
:parameters (?v10 ?v7)
:precondition (and (pred_10 ?v10) (pred_2 ?v7) 
                  (pred_3 ?v10) (pred_8 ?v7))
:effect (and (pred_7 ) (pred_6 ?v7 ?v10) (not (pred_8 ?v7)))))


	
