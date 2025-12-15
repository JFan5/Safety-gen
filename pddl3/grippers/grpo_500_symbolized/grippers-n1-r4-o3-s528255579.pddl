(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_09 - type_1
obj_05 obj_04 - type_3
obj_06 obj_02 obj_01 obj_10 - type_2
obj_03 obj_08 obj_07 - object)
(:init
(pred_3 obj_09 obj_06)
(pred_4 obj_09 obj_05)
(pred_4 obj_09 obj_04)
(pred_2 obj_03 obj_10)
(pred_2 obj_08 obj_06)
(pred_2 obj_07 obj_01)
)
(:goal
(and
(pred_2 obj_03 obj_10)
(pred_2 obj_08 obj_01)
(pred_2 obj_07 obj_10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_09 ?b obj_04))))
)
)