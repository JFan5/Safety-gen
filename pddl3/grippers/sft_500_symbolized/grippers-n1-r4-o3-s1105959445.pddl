(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_2
obj_07 obj_04 - type_3
obj_08 obj_09 obj_05 obj_06 - type_1
obj_10 obj_02 obj_03 - object)
(:init
(pred_1 obj_01 obj_09)
(pred_2 obj_01 obj_07)
(pred_2 obj_01 obj_04)
(pred_4 obj_10 obj_09)
(pred_4 obj_02 obj_05)
(pred_4 obj_03 obj_08)
)
(:goal
(and
(pred_4 obj_10 obj_06)
(pred_4 obj_02 obj_06)
(pred_4 obj_03 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_01 ?b obj_04))))
)
)