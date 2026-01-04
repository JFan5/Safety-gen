(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_03 - type_2
obj_09 obj_02 - type_1
obj_07 obj_08 obj_10 obj_04 - type_3
obj_06 obj_05 obj_01 - object)
(:init
(pred_2 obj_03 obj_04)
(pred_1 obj_03 obj_09)
(pred_1 obj_03 obj_02)
(pred_3 obj_06 obj_04)
(pred_3 obj_05 obj_07)
(pred_3 obj_01 obj_07)
)
(:goal
(and
(pred_3 obj_06 obj_04)
(pred_3 obj_05 obj_10)
(pred_3 obj_01 obj_10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_03 ?b obj_02))))
)
)