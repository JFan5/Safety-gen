(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_10 - type_1
obj_06 obj_09 - type_2
obj_07 obj_01 obj_05 obj_02 - type_3
obj_03 obj_04 obj_08 - object)
(:init
(pred_1 obj_10 obj_02)
(pred_2 obj_10 obj_06)
(pred_2 obj_10 obj_09)
(pred_4 obj_03 obj_07)
(pred_4 obj_04 obj_05)
(pred_4 obj_08 obj_01)
)
(:goal
(and
(pred_4 obj_03 obj_02)
(pred_4 obj_04 obj_02)
(pred_4 obj_08 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_10 ?b obj_09))))
)
)