(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_2
obj_02 obj_06 - type_3
obj_03 obj_09 obj_10 obj_07 - type_1
obj_04 obj_01 obj_08 - object)
(:init
(pred_3 obj_05 obj_07)
(pred_2 obj_05 obj_02)
(pred_2 obj_05 obj_06)
(pred_1 obj_04 obj_09)
(pred_1 obj_01 obj_09)
(pred_1 obj_08 obj_10)
)
(:goal
(and
(pred_1 obj_04 obj_03)
(pred_1 obj_01 obj_07)
(pred_1 obj_08 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_05 ?b obj_06))))
)
)