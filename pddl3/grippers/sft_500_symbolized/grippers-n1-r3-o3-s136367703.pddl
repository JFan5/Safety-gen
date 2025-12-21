(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_05 obj_09 - type_2
obj_01 obj_02 obj_04 - type_3
obj_07 obj_03 obj_06 - object)
(:init
(pred_1 obj_08 obj_01)
(pred_3 obj_08 obj_05)
(pred_3 obj_08 obj_09)
(pred_2 obj_07 obj_02)
(pred_2 obj_03 obj_01)
(pred_2 obj_06 obj_02)
)
(:goal
(and
(pred_2 obj_07 obj_02)
(pred_2 obj_03 obj_04)
(pred_2 obj_06 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_08 ?b obj_09))))
)
)