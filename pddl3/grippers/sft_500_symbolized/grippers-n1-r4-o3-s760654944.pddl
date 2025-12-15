(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_2
obj_07 obj_09 - type_1
obj_04 obj_05 obj_06 obj_03 - type_3
obj_10 obj_08 obj_01 - object)
(:init
(pred_3 obj_02 obj_03)
(pred_1 obj_02 obj_07)
(pred_1 obj_02 obj_09)
(pred_4 obj_10 obj_03)
(pred_4 obj_08 obj_05)
(pred_4 obj_01 obj_03)
)
(:goal
(and
(pred_4 obj_10 obj_04)
(pred_4 obj_08 obj_03)
(pred_4 obj_01 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_02 ?b obj_09))))
)
)