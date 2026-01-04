; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 568780259 --problem-name spanner-s4-n3-l4-s568780259
(define (problem spanner-s4-n3-l4-s568780259)
 (:domain spanner)
 (:objects 
     obj_12 - type_3
     obj_06 obj_01 obj_07 obj_11 - type_2
     obj_08 obj_04 obj_13 - type_4
     obj_03 obj_10 obj_02 obj_05 - type_1
     obj_09 obj_14 - type_1
    )
 (:init 
    (pred_4 obj_12 obj_09)
    (pred_4 obj_06 obj_03)
    (pred_3 obj_06)
    (pred_4 obj_01 obj_10)
    (pred_3 obj_01)
    (pred_4 obj_07 obj_02)
    (pred_3 obj_07)
    (pred_4 obj_11 obj_10)
    (pred_3 obj_11)
    (pred_6 obj_08)
    (pred_4 obj_08 obj_14)
    (pred_6 obj_04)
    (pred_4 obj_04 obj_14)
    (pred_6 obj_13)
    (pred_4 obj_13 obj_14)
    (pred_5 obj_09 obj_03)
    (pred_5 obj_05 obj_14)
    (pred_5 obj_03 obj_10)
    (pred_5 obj_10 obj_02)
    (pred_5 obj_02 obj_05)
)
 (:goal
  (and
   (pred_1 obj_08)
   (pred_1 obj_04)
   (pred_1 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_08)) (not (pred_1 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_4 ?m obj_09)))
  )
)
)
