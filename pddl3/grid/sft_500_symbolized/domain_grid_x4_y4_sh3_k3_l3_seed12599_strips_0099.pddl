(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v2 ?v5)
             (pred_3 ?v1 ?v9)
             (pred_11 ?v2 ?v9)
             (pred_5 ?v7 ?v2 )
	     (pred_8 ?v2)
             (pred_7 ?v12)
             (pred_4 ?v1)
             (pred_12 ?v9)
             (pred_1 ?v2)
             (pred_10 ?v1)
             (pred_2 ?v2)
             (pred_9 ))



(:action op_1
:parameters (?v4 ?v13 ?v11 ?v3)
:precondition (and (pred_7 ?v4) (pred_7 ?v13) (pred_4 ?v11) (pred_12 ?v3)
          (pred_6 ?v4 ?v13) (pred_3 ?v11 ?v3)
                   (pred_11 ?v13 ?v3) (pred_8 ?v4) 
                   (pred_1 ?v13) (pred_10 ?v11))
:effect (and  (pred_2 ?v13) (not (pred_1 ?v13))))


(:action op_4
:parameters (?v4 ?v8)
:precondition (and (pred_7 ?v4) (pred_7 ?v8)
               (pred_8 ?v4) (pred_6 ?v4 ?v8) (pred_2 ?v8))
:effect (and (pred_8 ?v8) (not (pred_8 ?v4))))

(:action op_3
:parameters (?v4 ?v11)
:precondition (and (pred_7 ?v4) (pred_4 ?v11) 
                  (pred_8 ?v4) (pred_5 ?v11 ?v4) (pred_9 ))
:effect (and (pred_10 ?v11)
   (not (pred_5 ?v11 ?v4)) (not (pred_9 ))))


(:action op_2
:parameters (?v4 ?v6 ?v10)
:precondition (and (pred_7 ?v4) (pred_4 ?v6) (pred_4 ?v10)
                  (pred_8 ?v4) (pred_10 ?v10) (pred_5 ?v6 ?v4))
:effect (and (pred_10 ?v6) (pred_5 ?v10 ?v4)
        (not (pred_10 ?v10)) (not (pred_5 ?v6 ?v4))))

(:action op_5
:parameters (?v4 ?v11)
:precondition (and (pred_7 ?v4) (pred_4 ?v11) 
                  (pred_8 ?v4) (pred_10 ?v11))
:effect (and (pred_9 ) (pred_5 ?v11 ?v4) (not (pred_10 ?v11)))))


	
