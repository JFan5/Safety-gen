(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_3
obj_10 obj_09 - type_2
obj_04 obj_07 obj_01 obj_02 - type_1
obj_03 obj_06 obj_05 - object)
(:init
(pred_3 obj_08 obj_02)
(pred_1 obj_08 obj_10)
(pred_1 obj_08 obj_09)
(pred_4 obj_03 obj_04)
(pred_4 obj_06 obj_07)
(pred_4 obj_05 obj_02)
)
(:goal
(and
(pred_4 obj_03 obj_07)
(pred_4 obj_06 obj_04)
(pred_4 obj_05 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_08 ?b obj_09))))
)
)