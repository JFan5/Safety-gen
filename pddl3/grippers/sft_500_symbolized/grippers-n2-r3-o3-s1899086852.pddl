(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_11 - type_1
obj_06 obj_10 obj_04 obj_03 - type_2
obj_07 obj_08 obj_01 - type_3
obj_09 obj_12 obj_05 - object)
(:init
(pred_1 obj_02 obj_01)
(pred_3 obj_02 obj_06)
(pred_3 obj_02 obj_10)
(pred_1 obj_11 obj_08)
(pred_3 obj_11 obj_04)
(pred_3 obj_11 obj_03)
(pred_2 obj_09 obj_07)
(pred_2 obj_12 obj_07)
(pred_2 obj_05 obj_08)
)
(:goal
(and
(pred_2 obj_09 obj_01)
(pred_2 obj_12 obj_08)
(pred_2 obj_05 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_02 obj_01) (pred_1 obj_11 obj_01))))
  )
)
)