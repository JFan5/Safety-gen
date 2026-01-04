; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 292407928 --problem-name spanner-s4-n3-l4-s292407928
(define (problem spanner-s4-n3-l4-s292407928)
 (:domain spanner)
 (:objects 
     obj_13 - type_5
     obj_06 obj_10 obj_09 obj_05 - type_4
     obj_04 obj_02 obj_03 - type_2
     obj_14 obj_08 obj_01 obj_11 - type_1
     obj_07 obj_12 - type_1
    )
 (:init 
    (pred_4 obj_13 obj_07)
    (pred_4 obj_06 obj_01)
    (pred_3 obj_06)
    (pred_4 obj_10 obj_11)
    (pred_3 obj_10)
    (pred_4 obj_09 obj_08)
    (pred_3 obj_09)
    (pred_4 obj_05 obj_14)
    (pred_3 obj_05)
    (pred_2 obj_04)
    (pred_4 obj_04 obj_12)
    (pred_2 obj_02)
    (pred_4 obj_02 obj_12)
    (pred_2 obj_03)
    (pred_4 obj_03 obj_12)
    (pred_6 obj_07 obj_14)
    (pred_6 obj_11 obj_12)
    (pred_6 obj_14 obj_08)
    (pred_6 obj_08 obj_01)
    (pred_6 obj_01 obj_11)
)
 (:goal
  (and
   (pred_5 obj_04)
   (pred_5 obj_02)
   (pred_5 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_02)) (not (pred_5 obj_03))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_07)))
  )
)
)
