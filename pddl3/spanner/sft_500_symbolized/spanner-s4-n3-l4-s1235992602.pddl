; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1235992602 --problem-name spanner-s4-n3-l4-s1235992602
(define (problem spanner-s4-n3-l4-s1235992602)
 (:domain spanner)
 (:objects 
     obj_06 - type_3
     obj_08 obj_09 obj_14 obj_05 - type_5
     obj_11 obj_01 obj_03 - type_4
     obj_07 obj_13 obj_12 obj_10 - type_2
     obj_04 obj_02 - type_2
    )
 (:init 
    (pred_2 obj_06 obj_04)
    (pred_2 obj_08 obj_13)
    (pred_1 obj_08)
    (pred_2 obj_09 obj_13)
    (pred_1 obj_09)
    (pred_2 obj_14 obj_12)
    (pred_1 obj_14)
    (pred_2 obj_05 obj_13)
    (pred_1 obj_05)
    (pred_5 obj_11)
    (pred_2 obj_11 obj_02)
    (pred_5 obj_01)
    (pred_2 obj_01 obj_02)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_02)
    (pred_6 obj_04 obj_07)
    (pred_6 obj_10 obj_02)
    (pred_6 obj_07 obj_13)
    (pred_6 obj_13 obj_12)
    (pred_6 obj_12 obj_10)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_01)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_11)) (not (pred_3 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_04)))
  )
)
)
