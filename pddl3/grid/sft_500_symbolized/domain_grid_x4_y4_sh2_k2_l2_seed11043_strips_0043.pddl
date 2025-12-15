(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v5 ?v3)
             (pred_4 ?v8 ?v6)
             (pred_6 ?v5 ?v6)
             (pred_2 ?v4 ?v5 )
	     (pred_5 ?v5)
             (pred_10 ?v13)
             (pred_9 ?v8)
             (pred_1 ?v6)
             (pred_7 ?v5)
             (pred_3 ?v8)
             (pred_8 ?v5)
             (pred_11 ))



(:action op_2
:parameters (?v11 ?v12 ?v9 ?v7)
:precondition (and (pred_10 ?v11) (pred_10 ?v12) (pred_9 ?v9) (pred_1 ?v7)
          (pred_12 ?v11 ?v12) (pred_4 ?v9 ?v7)
                   (pred_6 ?v12 ?v7) (pred_5 ?v11) 
                   (pred_7 ?v12) (pred_3 ?v9))
:effect (and  (pred_8 ?v12) (not (pred_7 ?v12))))


(:action op_3
:parameters (?v11 ?v1)
:precondition (and (pred_10 ?v11) (pred_10 ?v1)
               (pred_5 ?v11) (pred_12 ?v11 ?v1) (pred_8 ?v1))
:effect (and (pred_5 ?v1) (not (pred_5 ?v11))))

(:action op_4
:parameters (?v11 ?v9)
:precondition (and (pred_10 ?v11) (pred_9 ?v9) 
                  (pred_5 ?v11) (pred_2 ?v9 ?v11) (pred_11 ))
:effect (and (pred_3 ?v9)
   (not (pred_2 ?v9 ?v11)) (not (pred_11 ))))


(:action op_5
:parameters (?v11 ?v10 ?v2)
:precondition (and (pred_10 ?v11) (pred_9 ?v10) (pred_9 ?v2)
                  (pred_5 ?v11) (pred_3 ?v2) (pred_2 ?v10 ?v11))
:effect (and (pred_3 ?v10) (pred_2 ?v2 ?v11)
        (not (pred_3 ?v2)) (not (pred_2 ?v10 ?v11))))

(:action op_1
:parameters (?v11 ?v9)
:precondition (and (pred_10 ?v11) (pred_9 ?v9) 
                  (pred_5 ?v11) (pred_3 ?v9))
:effect (and (pred_11 ) (pred_2 ?v9 ?v11) (not (pred_3 ?v9)))))


	
