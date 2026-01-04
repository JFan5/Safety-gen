(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_3
obj_01 obj_09 - type_1
obj_07 obj_02 obj_04 obj_05 - type_2
obj_08 obj_10 obj_03 - object)
(:init
(pred_4 obj_06 obj_04)
(pred_2 obj_06 obj_01)
(pred_2 obj_06 obj_09)
(pred_1 obj_08 obj_02)
(pred_1 obj_10 obj_07)
(pred_1 obj_03 obj_05)
)
(:goal
(and
(pred_1 obj_08 obj_04)
(pred_1 obj_10 obj_04)
(pred_1 obj_03 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_06 ?b obj_09))))
)
)