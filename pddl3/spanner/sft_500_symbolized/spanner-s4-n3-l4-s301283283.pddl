; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 301283283 --problem-name spanner-s4-n3-l4-s301283283
(define (problem spanner-s4-n3-l4-s301283283)
 (:domain spanner)
 (:objects 
     obj_08 - type_1
     obj_05 obj_04 obj_13 obj_14 - type_5
     obj_12 obj_06 obj_01 - type_3
     obj_10 obj_09 obj_03 obj_11 - type_2
     obj_07 obj_02 - type_2
    )
 (:init 
    (pred_3 obj_08 obj_07)
    (pred_3 obj_05 obj_03)
    (pred_5 obj_05)
    (pred_3 obj_04 obj_11)
    (pred_5 obj_04)
    (pred_3 obj_13 obj_03)
    (pred_5 obj_13)
    (pred_3 obj_14 obj_03)
    (pred_5 obj_14)
    (pred_4 obj_12)
    (pred_3 obj_12 obj_02)
    (pred_4 obj_06)
    (pred_3 obj_06 obj_02)
    (pred_4 obj_01)
    (pred_3 obj_01 obj_02)
    (pred_6 obj_07 obj_10)
    (pred_6 obj_11 obj_02)
    (pred_6 obj_10 obj_09)
    (pred_6 obj_09 obj_03)
    (pred_6 obj_03 obj_11)
)
 (:goal
  (and
   (pred_1 obj_12)
   (pred_1 obj_06)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_06)) (not (pred_1 obj_01))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_07)))
  )
)
)
