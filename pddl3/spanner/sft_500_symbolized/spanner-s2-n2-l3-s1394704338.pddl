; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1394704338 --problem-name spanner-s2-n2-l3-s1394704338
(define (problem spanner-s2-n2-l3-s1394704338)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_09 obj_07 - type_5
     obj_08 obj_10 - type_2
     obj_01 obj_04 obj_02 - type_1
     obj_06 obj_03 - type_1
    )
 (:init 
    (pred_4 obj_05 obj_06)
    (pred_4 obj_09 obj_04)
    (pred_6 obj_09)
    (pred_4 obj_07 obj_02)
    (pred_6 obj_07)
    (pred_1 obj_08)
    (pred_4 obj_08 obj_03)
    (pred_1 obj_10)
    (pred_4 obj_10 obj_03)
    (pred_3 obj_06 obj_01)
    (pred_3 obj_02 obj_03)
    (pred_3 obj_01 obj_04)
    (pred_3 obj_04 obj_02)
)
 (:goal
  (and
   (pred_5 obj_08)
   (pred_5 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_08)) (not (pred_5 obj_10))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_06)))
  )
)
)
