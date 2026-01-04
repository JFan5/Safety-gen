; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1546595130 --problem-name spanner-s2-n2-l3-s1546595130
(define (problem spanner-s2-n2-l3-s1546595130)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_02 obj_05 - type_2
     obj_07 obj_03 - type_5
     obj_01 obj_08 obj_09 - type_3
     obj_10 obj_04 - type_3
    )
 (:init 
    (pred_5 obj_06 obj_10)
    (pred_5 obj_02 obj_08)
    (pred_1 obj_02)
    (pred_5 obj_05 obj_01)
    (pred_1 obj_05)
    (pred_6 obj_07)
    (pred_5 obj_07 obj_04)
    (pred_6 obj_03)
    (pred_5 obj_03 obj_04)
    (pred_4 obj_10 obj_01)
    (pred_4 obj_09 obj_04)
    (pred_4 obj_01 obj_08)
    (pred_4 obj_08 obj_09)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_03))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_10)))
  )
)
)
