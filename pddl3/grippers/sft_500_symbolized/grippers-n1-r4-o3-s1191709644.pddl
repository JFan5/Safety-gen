(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_03 - type_3
obj_05 obj_04 - type_2
obj_07 obj_02 obj_06 obj_08 - type_1
obj_01 obj_09 obj_10 - object)
(:init
(pred_2 obj_03 obj_08)
(pred_4 obj_03 obj_05)
(pred_4 obj_03 obj_04)
(pred_1 obj_01 obj_08)
(pred_1 obj_09 obj_06)
(pred_1 obj_10 obj_07)
)
(:goal
(and
(pred_1 obj_01 obj_06)
(pred_1 obj_09 obj_08)
(pred_1 obj_10 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_03 ?b obj_04))))
)
)