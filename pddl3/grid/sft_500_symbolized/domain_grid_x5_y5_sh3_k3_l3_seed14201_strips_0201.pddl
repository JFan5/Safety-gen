(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v5 ?v2)
             (pred_12 ?v10 ?v12)
             (pred_1 ?v5 ?v12)
             (pred_3 ?v13 ?v5 )
	     (pred_11 ?v5)
             (pred_9 ?v8)
             (pred_2 ?v10)
             (pred_6 ?v12)
             (pred_5 ?v5)
             (pred_10 ?v10)
             (pred_4 ?v5)
             (pred_7 ))



(:action op_1
:parameters (?v11 ?v6 ?v3 ?v1)
:precondition (and (pred_9 ?v11) (pred_9 ?v6) (pred_2 ?v3) (pred_6 ?v1)
          (pred_8 ?v11 ?v6) (pred_12 ?v3 ?v1)
                   (pred_1 ?v6 ?v1) (pred_11 ?v11) 
                   (pred_5 ?v6) (pred_10 ?v3))
:effect (and  (pred_4 ?v6) (not (pred_5 ?v6))))


(:action op_5
:parameters (?v11 ?v9)
:precondition (and (pred_9 ?v11) (pred_9 ?v9)
               (pred_11 ?v11) (pred_8 ?v11 ?v9) (pred_4 ?v9))
:effect (and (pred_11 ?v9) (not (pred_11 ?v11))))

(:action op_2
:parameters (?v11 ?v3)
:precondition (and (pred_9 ?v11) (pred_2 ?v3) 
                  (pred_11 ?v11) (pred_3 ?v3 ?v11) (pred_7 ))
:effect (and (pred_10 ?v3)
   (not (pred_3 ?v3 ?v11)) (not (pred_7 ))))


(:action op_3
:parameters (?v11 ?v7 ?v4)
:precondition (and (pred_9 ?v11) (pred_2 ?v7) (pred_2 ?v4)
                  (pred_11 ?v11) (pred_10 ?v4) (pred_3 ?v7 ?v11))
:effect (and (pred_10 ?v7) (pred_3 ?v4 ?v11)
        (not (pred_10 ?v4)) (not (pred_3 ?v7 ?v11))))

(:action op_4
:parameters (?v11 ?v3)
:precondition (and (pred_9 ?v11) (pred_2 ?v3) 
                  (pred_11 ?v11) (pred_10 ?v3))
:effect (and (pred_7 ) (pred_3 ?v3 ?v11) (not (pred_10 ?v3)))))


	
