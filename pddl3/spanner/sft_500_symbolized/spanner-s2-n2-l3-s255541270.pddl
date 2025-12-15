; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 255541270 --problem-name spanner-s2-n2-l3-s255541270
(define (problem spanner-s2-n2-l3-s255541270)
 (:domain spanner)
 (:objects 
     obj_08 - type_2
     obj_10 obj_09 - type_5
     obj_04 obj_05 - type_4
     obj_03 obj_06 obj_07 - type_3
     obj_01 obj_02 - type_3
    )
 (:init 
    (pred_6 obj_08 obj_01)
    (pred_6 obj_10 obj_07)
    (pred_3 obj_10)
    (pred_6 obj_09 obj_03)
    (pred_3 obj_09)
    (pred_1 obj_04)
    (pred_6 obj_04 obj_02)
    (pred_1 obj_05)
    (pred_6 obj_05 obj_02)
    (pred_4 obj_01 obj_03)
    (pred_4 obj_07 obj_02)
    (pred_4 obj_03 obj_06)
    (pred_4 obj_06 obj_07)
)
 (:goal
  (and
   (pred_5 obj_04)
   (pred_5 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_04)) (not (pred_5 obj_05))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_01)))
  )
)
)
