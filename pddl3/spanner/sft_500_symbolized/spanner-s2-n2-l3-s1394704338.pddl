; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1394704338 --problem-name spanner-s2-n2-l3-s1394704338
(define (problem spanner-s2-n2-l3-s1394704338)
 (:domain spanner)
 (:objects 
     obj_10 - type_1
     obj_02 obj_06 - type_4
     obj_05 obj_03 - type_5
     obj_07 obj_04 obj_08 - type_2
     obj_09 obj_01 - type_2
    )
 (:init 
    (pred_5 obj_10 obj_09)
    (pred_5 obj_02 obj_04)
    (pred_6 obj_02)
    (pred_5 obj_06 obj_08)
    (pred_6 obj_06)
    (pred_4 obj_05)
    (pred_5 obj_05 obj_01)
    (pred_4 obj_03)
    (pred_5 obj_03 obj_01)
    (pred_2 obj_09 obj_07)
    (pred_2 obj_08 obj_01)
    (pred_2 obj_07 obj_04)
    (pred_2 obj_04 obj_08)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_03))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_09)))
  )
)
)
