; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1235992602 --problem-name spanner-s4-n3-l4-s1235992602
(define (problem spanner-s4-n3-l4-s1235992602)
 (:domain spanner)
 (:objects 
     obj_03 - type_3
     obj_11 obj_13 obj_10 obj_06 - type_1
     obj_14 obj_01 obj_08 - type_4
     obj_02 obj_09 obj_12 obj_04 - type_2
     obj_07 obj_05 - type_2
    )
 (:init 
    (pred_5 obj_03 obj_07)
    (pred_5 obj_11 obj_09)
    (pred_4 obj_11)
    (pred_5 obj_13 obj_09)
    (pred_4 obj_13)
    (pred_5 obj_10 obj_12)
    (pred_4 obj_10)
    (pred_5 obj_06 obj_09)
    (pred_4 obj_06)
    (pred_3 obj_14)
    (pred_5 obj_14 obj_05)
    (pred_3 obj_01)
    (pred_5 obj_01 obj_05)
    (pred_3 obj_08)
    (pred_5 obj_08 obj_05)
    (pred_6 obj_07 obj_02)
    (pred_6 obj_04 obj_05)
    (pred_6 obj_02 obj_09)
    (pred_6 obj_09 obj_12)
    (pred_6 obj_12 obj_04)
)
 (:goal
  (and
   (pred_2 obj_14)
   (pred_2 obj_01)
   (pred_2 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_14)) (not (pred_2 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_07)))
  )
)
)
