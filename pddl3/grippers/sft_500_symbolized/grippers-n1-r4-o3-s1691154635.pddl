(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_2
obj_04 obj_09 - type_1
obj_05 obj_03 obj_07 obj_10 - type_3
obj_06 obj_08 obj_02 - object)
(:init
(pred_1 obj_01 obj_10)
(pred_2 obj_01 obj_04)
(pred_2 obj_01 obj_09)
(pred_4 obj_06 obj_03)
(pred_4 obj_08 obj_05)
(pred_4 obj_02 obj_07)
)
(:goal
(and
(pred_4 obj_06 obj_03)
(pred_4 obj_08 obj_07)
(pred_4 obj_02 obj_10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_01 ?b obj_09))))
)
)