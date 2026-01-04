(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_1
obj_08 obj_09 - type_2
obj_10 obj_02 obj_07 obj_06 - type_3
obj_03 obj_04 obj_05 - object)
(:init
(pred_2 obj_01 obj_10)
(pred_1 obj_01 obj_08)
(pred_1 obj_01 obj_09)
(pred_3 obj_03 obj_10)
(pred_3 obj_04 obj_06)
(pred_3 obj_05 obj_07)
)
(:goal
(and
(pred_3 obj_03 obj_10)
(pred_3 obj_04 obj_02)
(pred_3 obj_05 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_01 ?b obj_08))))
)
)