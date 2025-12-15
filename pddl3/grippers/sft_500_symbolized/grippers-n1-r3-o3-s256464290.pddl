(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_06 - type_3
obj_09 obj_05 - type_1
obj_03 obj_01 obj_02 - type_2
obj_08 obj_07 obj_04 - object)
(:init
(pred_2 obj_06 obj_03)
(pred_1 obj_06 obj_09)
(pred_1 obj_06 obj_05)
(pred_3 obj_08 obj_03)
(pred_3 obj_07 obj_02)
(pred_3 obj_04 obj_02)
)
(:goal
(and
(pred_3 obj_08 obj_02)
(pred_3 obj_07 obj_02)
(pred_3 obj_04 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_06 ?b obj_05))))
)
)