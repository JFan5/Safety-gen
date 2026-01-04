(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_2
obj_04 obj_03 - type_3
obj_06 obj_07 obj_05 obj_01 - type_1
obj_09 obj_08 obj_10 - object)
(:init
(pred_1 obj_02 obj_01)
(pred_4 obj_02 obj_04)
(pred_4 obj_02 obj_03)
(pred_2 obj_09 obj_07)
(pred_2 obj_08 obj_06)
(pred_2 obj_10 obj_06)
)
(:goal
(and
(pred_2 obj_09 obj_01)
(pred_2 obj_08 obj_06)
(pred_2 obj_10 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_02 ?b obj_04))))
)
)